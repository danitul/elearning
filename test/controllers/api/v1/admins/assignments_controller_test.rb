require 'test_helper'

class Api::V1::Admins::AssignmentsControllerTest < ActionDispatch::IntegrationTest
  describe 'Api::V1::Admins::AssignmentsController' do
    let (:url) { "/api/v1/admins/lessons" }

    let (:admin) { create(:user) }

    let (:user) { create(:user) }
    let (:course) { create(:course, user: user) }
    let (:lesson) { create(:lesson, course: course) }

    let (:lesson_url) { "#{url}/#{lesson.id}/assignments" }

    describe 'show' do
      let (:assignment) { create(:assignment, lesson: lesson, is_done: true) }
      let (:video_content_type) { Assignment::CONTENT_TYPES[:video] }

      it 'should return the specific assignment with video content type' do
        assignment.video!
        get "#{lesson_url}/#{assignment.id}", params: { content_type: video_content_type }

        json = JSON.parse(@response.body)

        assert_response :success
        assert_equal assignment.id, json['id']
        assert_equal assignment.name, json['name']
        assert_equal assignment.content_type, json['content_type']
        assert_equal assignment.content_url, json['content_url']
        assert_equal assignment.is_done, json['is_done']
        assert_true assignment.video?
      end

      it 'should return not found error if assignment not found' do
        get "#{lesson_url}/-1", params: { content_type: video_content_type }

        json = JSON.parse(@response.body)
        assert_response 404

        expected_response = "Assignment with id -1 was not found"
        assert_equal expected_response, json['errors']
      end
    end

  end
end
