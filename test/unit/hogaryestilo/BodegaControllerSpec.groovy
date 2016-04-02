package hogaryestilo



import grails.test.mixin.*
import spock.lang.*

@TestFor(BodegaController)
@Mock(Bodega)
class BodegaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.bodegaInstanceList
            model.bodegaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.bodegaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def bodega = new Bodega()
            bodega.validate()
            controller.save(bodega)

        then:"The create view is rendered again with the correct model"
            model.bodegaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            bodega = new Bodega(params)

            controller.save(bodega)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/bodega/show/1'
            controller.flash.message != null
            Bodega.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def bodega = new Bodega(params)
            controller.show(bodega)

        then:"A model is populated containing the domain instance"
            model.bodegaInstance == bodega
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def bodega = new Bodega(params)
            controller.edit(bodega)

        then:"A model is populated containing the domain instance"
            model.bodegaInstance == bodega
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/bodega/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def bodega = new Bodega()
            bodega.validate()
            controller.update(bodega)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.bodegaInstance == bodega

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            bodega = new Bodega(params).save(flush: true)
            controller.update(bodega)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/bodega/show/$bodega.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/bodega/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def bodega = new Bodega(params).save(flush: true)

        then:"It exists"
            Bodega.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(bodega)

        then:"The instance is deleted"
            Bodega.count() == 0
            response.redirectedUrl == '/bodega/index'
            flash.message != null
    }
}
