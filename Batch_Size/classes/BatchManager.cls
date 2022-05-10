public With Sharing class BatchManager {

    private static final String DEFAULT_RECORD_NAME = 'DefaultOrgBatchSize';

    public static Id executeBatch(Database.Batchable<sObject> batch, String className) {    
        return Database.executeBatch(batch, getSize(className));
    }

    @TestVisible
    private static Integer getSize(String className) {
        List<pmact__BatchSize__mdt> lSize = [SELECT Id,
                                                DeveloperName, 
                                                pmact__Size__c 
                                                FROM pmact__BatchSize__mdt
                                                WHERE DeveloperName = :className
                                                WITH SECURITY_ENFORCED];
        lSize = !lSize.isEmpty()? lSize:[SELECT Id,
                                            DeveloperName, 
                                            pmact__Size__c 
                                            FROM pmact__BatchSize__mdt
                                            WHERE DeveloperName = :DEFAULT_RECORD_NAME
                                            WITH SECURITY_ENFORCED];
        System.debug('<<<pmactBatchManager.getSize>>> '+lSize[0].pmact__Size__c.intValue());                                                                       
        return lSize[0].pmact__Size__c.intValue();                                    
    }
}