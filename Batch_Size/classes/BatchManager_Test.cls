@isTest
private class BatchManager_Test {

    @isTest static void stepOne() {
        System.assertEquals(200, BatchManager.getSize(''), 'ALL OK');
    }
}