module Unicoder
  def unicode(s)
    return "" if s.nil? or s.blank?
    s.gsub(/^\["/,'').gsub(/"\]$/,'').split('\u').reject(&:blank?).map{|e| e =~ /^[0-9,a-f]{4}$/ ? e.hex : e.unpack("U*")}.flatten.pack("U*")
  end
end
