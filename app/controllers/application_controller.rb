class ApplicationController < ActionController::Base
  include ControllerAuthentication
  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to welcome_url, :alert => exception.message
    else
      redirect_to login_url, :alert => exception.message
    end
  end
  protect_from_forgery
  before_filter :set_language #, :load_profile
  helper_method :current_user, :english?, :ft, :default_info_section, :unicode, :message, :chain

  def added(s); success(:added,s) end
  def admin?; current_user.role? :admin end
  def alert(act); t("alert.#{act}") end
  def alert2(act,obj); t("alert.#{act}",:obj=>obj) end
  def chain(s1,s2); "#{s1.to_s}.#{s2.to_s}" end
  def changed(s); success(:changed,s) end
  def created(s); success(:created,s) end
  def deleted(s); success(:deleted,s) end
  def d(s); t(s).downcase end
  def dp(s); pl(s).downcase end
  def english?; I18n.locale == :en end
  def ft(s); t("formtastic.labels.#{s.to_s}") end
  def ftd(s); d("formtastic.labels.#{s.to_s}") end  
  def god?; current_user.role? :god end
  def join(s1,s2); s1+t(:space)+s2 end
  def message(s); t(chain(:messages,s)) end
  def notify(act); t("notice.#{act}") end
  def pl(s); t(s).match(/\w/) ? t(s).pluralize : t(s) end  
  def saved(s); success(:saved,s) end
  def success(act,mdl); t("success.#{act}",:obj=>d(mdl)) end
  def success_p(act,mdl); t("success.#{act}",:obj=>dp(mdl)) end
  def success_p(act,owner,mdl); t("success.#{act}",:obj=>t(:possessive,:owner=>owner,:obj=>dp(mdl))) end
  def unicode(s)
    return "" if s.nil? or s.blank?
    s.gsub(/^\["/,'').gsub(/"\]$/,'').split('\u').reject(&:blank?).map{|e| e =~ /^[0-9,a-f]{4}$/ ? e.hex : e.unpack("U*")}.flatten.pack("U*")
  end
  def updated(s); success(:updated,s) end
  def updated_p(s); success_p(:updated,s) end
  def updated_p(s1,s2); success_p(:updated,s1,s2) end

  def toggle_language
    session[:language] = (session[:language] == 'ja' ? 'en' : 'ja')
    redirect_to :back
  end
  
  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def current_user_name; current_user && current_user.name end
    def current_user_email; current_user && current_user.email end
    def current_user_affiliation; current_user && current_user.affiliation end
    
    def load_profile; @profile = Profile.new unless @profile end
    def set_language
      session[:language] = params[:language].to_sym if params[:language]
      I18n.locale = session[:language] || I18n.default_locale
    end
end
