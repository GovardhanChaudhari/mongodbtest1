require 'test_helper'

class CutoffsControllerTest < ActionController::TestCase
  setup do
    @cutoff = cutoffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cutoffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cutoff" do
    assert_difference('Cutoff.count') do
      post :create, cutoff: { aieee_rank: @cutoff.aieee_rank, aieee_score: @cutoff.aieee_score, caste: @cutoff.caste, female_score: @cutoff.female_score, female_score_ou: @cutoff.female_score_ou, female_sml_rank: @cutoff.female_sml_rank, female_sml_rank_ou: @cutoff.female_sml_rank_ou, male_score: @cutoff.male_score, male_score_ou: @cutoff.male_score_ou, male_sml_rank: @cutoff.male_sml_rank, male_sml_rank_ou: @cutoff.male_sml_rank_ou, round: @cutoff.round, shift: @cutoff.shift }
    end

    assert_redirected_to cutoff_path(assigns(:cutoff))
  end

  test "should show cutoff" do
    get :show, id: @cutoff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cutoff
    assert_response :success
  end

  test "should update cutoff" do
    put :update, id: @cutoff, cutoff: { aieee_rank: @cutoff.aieee_rank, aieee_score: @cutoff.aieee_score, caste: @cutoff.caste, female_score: @cutoff.female_score, female_score_ou: @cutoff.female_score_ou, female_sml_rank: @cutoff.female_sml_rank, female_sml_rank_ou: @cutoff.female_sml_rank_ou, male_score: @cutoff.male_score, male_score_ou: @cutoff.male_score_ou, male_sml_rank: @cutoff.male_sml_rank, male_sml_rank_ou: @cutoff.male_sml_rank_ou, round: @cutoff.round, shift: @cutoff.shift }
    assert_redirected_to cutoff_path(assigns(:cutoff))
  end

  test "should destroy cutoff" do
    assert_difference('Cutoff.count', -1) do
      delete :destroy, id: @cutoff
    end

    assert_redirected_to cutoffs_path
  end
end
