trigger EmailMessageTrigger on EmailMessage (before insert) {
	for(EmailMessage em : Trigger.new){
		Case nc = new Case(Id = em.parentId, Email_Trigger__c=em.ToAddress);
		update nc;
	}
}