public with sharing class KA_Display_Controller {
	
	public Id caseId2 {get; set;}
	
	public KA_Display_Controller(){}

	public List<Case> getCasePassed(){
		return [select Id, subject from Case where Id=:caseId2];
	}

	public List<KnowledgeArticleVersion> getKAVersionList(){
		Set<Id> kaIds = new Set<Id>();
		
		for(CaseArticle ca : [select Id, knowledgearticleid from CaseArticle where CaseId = :caseId2]){
			System.debug('XXXXXXXXXXXXXXXXXX ca: ' + ca);
			kaIds.add(ca.knowledgearticleid);
		}
		
		return [SELECT Id, title, summary FROM KnowledgeArticleVersion WHERE PublishStatus='online' AND IsLatestVersion=true AND KnowledgeArticleId in :kaIds];
	}
}