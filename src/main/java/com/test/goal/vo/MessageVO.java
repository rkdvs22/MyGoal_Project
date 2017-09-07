package com.test.goal.vo;

public class MessageVO {
	private int msgNum;
	private String sender;
	private String receiver;
	private String msgTitle;
	private String msgContent;
	private String msgDate;
	
	public MessageVO() {
		
	}

	public MessageVO(int msgNum, String sender, String receiver, String msgTitle, String msgContent, String msgDate) {
		super();
		this.msgNum = msgNum;
		this.sender = sender;
		this.receiver = receiver;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.msgDate = msgDate;
	}

	public int getMsgNum() {
		return msgNum;
	}

	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(String msgDate) {
		this.msgDate = msgDate;
	}

	@Override
	public String toString() {
		return "MessageVO [msgNum=" + msgNum + ", sender=" + sender + ", receiver=" + receiver + ", msgTitle="
				+ msgTitle + ", msgContent=" + msgContent + ", msgDate=" + msgDate + "]";
	}

}
