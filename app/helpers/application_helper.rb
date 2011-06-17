module ApplicationHelper
  def add(s); t2(:add,s) end
  def chain(s1,s2); "#{s1.to_s}.#{s2.to_s}" end
  def contact_active?; !@message.nil? end
  def contact_info(english)
    @contact_info ||= Setting.count == 0 ? "" : ( english ? Setting.first.contact_info : Setting.first.contact_info_ja )
  end
  def create(s); t2(:create,s) end
  def current_language; english? ? t(:japanese) : t(:english) end
  def edit(s); t2(:edit,s) end
  def edit_p(s); tp2(:edit,s) end
  def either_of(b,s1,s2); b ? s1 : s2 end
  def lbl(s); chain(:label,s) end
  def locale(key); key.split('.')[0..-2].join('.') end
  def info_active?; !@info_section.nil? end
  def list(s); tp2(:list,s) end
  def new(s); t2(:new,s) end
  def pl(s); t(s).match(/[a-z,A-Z]/) ? t(s).pluralize : t(s) end
  def save(s); t2(:save,s) end
  def submit(s); t2(:submit,s) end
  def sure?; t('messages.sure?') end
  def t2(s1,s2); t(lbl(s1), :obj => t(s2)) end
  def unicode(s)
    s[1..-2].split('\u').reject(&:blank?).map{|e| e =~ /^[0-9,a-f]{4}$/ ? e.hex : e.unpack("U*")}.flatten.pack("U*")
  end
  def tp2(s1,s2); t(lbl(s1), :obj => pl(s2)) end
  def update(s); t2(:update,s) end
  def update_p(s); tp2(:update,s) end
  def verify(s); t2(:verify,s) end
  def view(s); tp2(:view,s) end
  def view_own(s); tp2(:view_own,s) end
end
