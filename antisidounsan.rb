# -*- coding: utf-8 -*-

Plugin.create(:antisidounsan) do

  DEFINED_TIME = Time.new.freeze
  exptmp = nil
  
  on_appear do |ms|
    ms.each do |m|
      if m.user.idname == "sidounsan" and m[:created] > DEFINED_TIME and !m.retweet?
        exptmp = m.body
        #�Ƃ肠�����O�_���[�_�ƃN�G�X�`�����}�[�N������
        exptmp = exptmp.gsub(/�c|�H/,'')
        if exptmp =~ /�ł�$|�Ȃ񂾂�Ȃ�$/
        Service.primary.post(:message => "#{"@" + m.user.idname + " " + "�Ⴄ�ł���"}", :replyto => m)
      end
    end
  end
end
