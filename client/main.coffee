Meteor.startup ->
    share.setFullscreenMargins()
    $(window).resize (evt) ->
        screenSize = Session.get("device-screensize")
        if screenSize is "small"
            $('body').addClass('mobile')
        else 
            $('body').removeClass('mobile')
    

share.setFullscreenMargins = ->
    settingsDep.depend()
    settings = Settings.findOne({})
    if settings
        layoutContainerMargins = {
            'margin-top' : settings.screenMarginTop
            'margin-right' : settings.screenMarginRight
            'margin-left' : settings.screenMarginLeft
        }
        footerPosition = {
            'right' : settings.screenMarginRight
            'bottom' : settings.screenMarginBottom
            'left' : settings.screenMarginLeft
        }
        _.defer ->
            $('.fullscreen #layout_container').css(layoutContainerMargins)
            $('.fullscreen #footer').css(footerPosition)


AutoForm.addHooks [
    "insertBeerForm"
    "updateBeerForm"
],
    # onSubmit: (insertDoc, updateDoc, currentDoc) ->

    # if we update we need to check if the current state is ontap=false and the future state is ontap=true
    # if we insert there is no current state of ontap so that is assumed false
    # when changing ontap state from false to true ask user if they want to send notification
    # if they indicate yes, queue it for sending to server side onSuccess
    # onSuccess or onError cleanup
    before:
        insert: (doc, template) ->
            share.currentlyOnTap = false
            share.willBeOnTap = doc.ontap  
            return doc

        update: (docId, modifier, template) ->
            currentBeer = Beers.findOne(docId)
            share.currentlyOnTap = currentBeer.ontap
            share.willBeOnTap = modifier.$set.ontap      
            return modifier

    #Called when any operation succeeds
    #operation will equal = insert, update, submit, or the method name
    onSuccess: (operation, result, template) ->
        if not share.currentlyOnTap and share.willBeOnTap
            share.askToSendNotification(template.data.doc)
            # share.currentlyOnTap = true
            # share.willBeOnTap = false     

    # onError: (operation, error, template) ->
    #     share.currentlyOnTap = false
    #     share.willBeOnTap = false   

    
share.askToSendNotification = (beer) ->
    bootbox.dialog
        title: "Notification Sender"
        message: '<div class="row notification-modal">' +
                    '<div class="col-md-12">' +
                        '<form class="form-horizontal">' +
                            '<div class="form-group">' +
                                '<div class="modal-body">'+
                                    '<label>
                                        Would you like to send a notification to all app users and members
                                        that this beer is going on tap? Each app user will get a system notification.
                                        Choosing no will still update the beer information.
                                    </label>' +
                                    '<p>&nbsp</p>' +
                                    '<label>
                                        The notification will have this content:
                                    </label>' +
                                    '<div class="panel panel-default">' +
                                        '<div class="panel-heading">' +
                                            'Tin Whiskers Brewing' +
                                        '</div>' +
                                        '<div class="panel-body">' +
                                            beer.name + ' has just been put on tap </p>' +
                                        '</div>' +
                                    '</div>' +
                                '</div>' +
                            '</div>' +
                        '</div>' +
                    '</div>' +
                '</div>'
        buttons:
            success:
                label: "Send notification"
                className: "btn-success"
                callback: ->
                    Meteor.call("sendNotification", beer)
                    return
            warning:
                label: "Save changes only"
                className: "btn-warning"
                callback: ->
                    return