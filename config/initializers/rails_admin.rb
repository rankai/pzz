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
      except ['PzzSmsHistory', 'PzzPayHistory', 'PzzOrder', 'PzzDrawHistory']
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

  config.model 'PzzUser' do
    navigation_icon 'icon-user'
    navigation_label 'User Manage'
  end


  config.model 'PzzCar' do
    navigation_label 'User Manage'
  end

  config.model 'PzzIdentity' do 
    navigation_label 'User Manage'
  end

  config.model 'Role' do 
    navigation_label 'User Manage'
  end

  config.model 'PzzUserMeta' do 
    # navigation_label 'User Manage'
    visible false
  end

  config.model 'PzzSms' do 
    # navigation_label 'User Manage'
    visible false
  end


  # histories tables read only kevin
  # sms_history
  # pay_history

  config.model 'PzzSmsHistory' do
    navigation_label 'Statistics'
  end

  config.model 'PzzPayHistory' do
    navigation_label 'Statistics'
  end

  config.model 'PzzMessage' do
    navigation_label 'Statistics'
  end

  config.model 'PzzUserDraw' do
    navigation_label 'Draws'
  end

  config.model 'PzzDrawConfig' do 
    navigation_label 'Draws'
  end

  config.model 'PzzDrawPrize' do
    navigation_label 'Draws'
  end

  config.model 'PzzDrawHistory' do
    navigation_label 'Draws'
  end

  config.model 'PzzTerm' do 
    visible false
  end

  config.model 'PzzTermRelationship' do 
    visible false
  end

  config.model 'PzzTermTaxonomy' do 
    navigation_label 'System Config'
  end

  config.model 'PzzOption' do 
    navigation_label 'System Config'
  end

  config.model 'PzzTemplate' do 
    navigation_label 'System Config'
  end

  config.model 'PzzLink' do 
    navigation_label 'System Config'
  end

  config.model 'PzzTraffic' do 
    navigation_label 'User Post'
  end

  config.model 'PzzComment' do 
    navigation_label 'User Post'
  end

  config.model 'PzzPost' do 
    navigation_label 'User Post'
  end

  config.model 'PzzPostMeta' do 
    # navigation_label 'User Manage'
    visible false
  end

  config.model 'PzzCommentMeta' do 
    visible false
  end

  config.model 'PzzOrder' do 
    navigation_label 'Carpool'
  end

  config.model 'PzzLine' do 
    navigation_label 'Carpool'
  end

  config.model 'RichFile' do
    visible false
  end

  config.model 'PzzCarImage' do
    visible false
  end

end
