RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
     warden.authenticate! scope: :pzz_user
  end
  config.current_user_method(&:current_pzz_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0
  config.audit_with :paper_trail, 'PzzUser', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory             
    index                         # mandatory
    new do 
      except ['PzzSmsHistory', 'PzzPayHistory', 'PzzOrder', 
        'PzzDrawHistory', 'PzzIdentity', 'PzzDriverIdentity']
    end
    export
    bulk_delete
    show
    edit do
      except ['PzzSmsHistory', 'PzzPayHistory', 'PzzDrawHistory']
    end
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end


  config.model 'PzzTermTaxonomy' do 
    navigation_label 'System Config'
    weight 19
  end


  config.model 'PzzTemplate' do 
    navigation_label 'System Config'
    weight 18
  end

  config.model 'PzzLink' do 
    navigation_label 'System Config'
    weight 17
  end

  config.model 'PzzOption' do 
    navigation_label 'System Config'
    weight 16
  end


  config.model 'PzzDrawHistory' do
    navigation_label 'Draws'
    weight 15
  end

  config.model 'PzzUserDraw' do
    navigation_label 'Draws'
    weight 14
  end

  config.model 'PzzDrawConfig' do 
    navigation_label 'Draws'
    weight 13
  end


  # histories tables read only kevin
  # sms_history
  # pay_history

  config.model 'PzzSmsHistory' do
    navigation_label 'Statistics'
    weight 12
  end

  config.model 'PzzPayHistory' do
    navigation_label 'Statistics'
    weight 11
  end

  config.model 'PzzMessage' do
    navigation_label 'Statistics'
    weight 10
  end
  config.model 'PzzTraffic' do 
    navigation_label 'User Post'
    weight 9
  end

  config.model 'PzzComment' do 
    navigation_label 'User Post'
    weight 8
  end

  config.model 'PzzPost' do 
    navigation_label 'User Post'
    weight 7
  end

  config.model 'PzzOrder' do 
    navigation_label 'Carpool'
    weight 6
  end

  config.model 'PzzLine' do 
    navigation_label 'Carpool'
    weight 5
  end

   config.model 'PzzCar' do
    navigation_label 'User Manage'
    weight 4
  end

  config.model 'PzzIdentity' do 
    navigation_label 'User Manage'
    weight 2
  end

  config.model 'PzzDriverIdentity' do 
    navigation_label 'User Manage'
    weight 3
  end

  config.model 'Role' do 
    navigation_label 'User Manage'
    weight 1
  end

   config.model 'PzzUser' do
    navigation_icon 'icon-user'
    navigation_label 'User Manage'
    weight 0
  end
  

  # invisible
  config.model 'PzzDrawPrize' do
    visible false
  end

  config.model 'PzzUserMeta' do 
    # navigation_label 'User Manage'
    visible false
  end

  config.model 'PzzSms' do 
    # navigation_label 'User Manage'
    visible false
  end

  config.model 'PzzTerm' do 
    visible false
  end

  config.model 'PzzTermRelationship' do 
    visible false
  end

  config.model 'PzzPostMeta' do 
    # navigation_label 'User Manage'
    visible false
  end

  config.model 'PzzCommentMeta' do 
    visible false
  end

  config.model 'PzzCarImage' do
    visible false
  end

end
