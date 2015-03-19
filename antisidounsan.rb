# -*- coding: utf-8 -*-

Plugin.create(:antisidounsan) do

  DEFINED_TIME = Time.new.freeze
  exptmp = nil
  
  on_appear do |ms|
    ms.each do |m|
      if m.user.idname == "sidounsan" and m[:created] > DEFINED_TIME and !m.retweet?
        exptmp = m.body
        #とりあえず三点リーダとクエスチョンマークを消す
        exptmp = exptmp.gsub(/…|？/,'')
        if exptmp =~ /では$|なんだよなあ$/
        Service.primary.post(:message => "#{"@" + m.user.idname + " " + "違うでしょ"}", :replyto => m)
      end
    end
  end
end
