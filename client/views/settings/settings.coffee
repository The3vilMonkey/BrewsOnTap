Template.settings.editingSettings = ->
    return Settings.findOne({})


Template.settings.events
    "click button.form-cancel": (evt) ->
        evt.preventDefault()
        Router.go('/ontap')

@settingsDep = new Tracker.Dependency

AutoForm.addHooks [
    "updateSettingsForm"
],
    onSuccess: () ->
        settingsDep.changed()