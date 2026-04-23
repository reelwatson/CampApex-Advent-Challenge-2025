
@isTest
private class MostNeededSupplyTest {

    // TO DO: Assert in each test the final contents of the Map that is created by the method
    // TO DO: Asset in each test the integers of the supplyList in their sorted order
    // TO DO: Assert in each test the maxSupplyItem number that is pulled from the supplyList

    @isTest
    static void eachItemUniqueTest() {
        List<String> shoppingList = new List<String>{
            'Wipes','Diapers','Formula','Bottles','Swaddles'
        };

        Test.startTest();
        MostNeededSupply uniqueItems = new MostNeededSupply();
        String mostNeededItem = uniqueItems.findMostNeededSupply(shoppingList);
        Test.stopTest();

        Assert.areEqual('Wipes', mostNeededItem, 'Wipes should have been the first most needed item in the list.');
    }

    @IsTest
    static void eachItemTheSameTest() {
        List<String> shoppingList = new List<String>{
            'Bottles','Bottles','Bottles','Bottles','Bottles'
        };

        Test.startTest();
        MostNeededSupply uniqueItems = new MostNeededSupply();
        String mostNeededItem = uniqueItems.findMostNeededSupply(shoppingList);
        Test.stopTest();

        Assert.areEqual('Bottles', mostNeededItem, 'Bottles should have been the most needed item in the list as the only item.');
    }

    @IsTest
    static void randomItemsTest() {
        List<String> shoppingList = new List<String>{
            'Socks','Wipes','Bottles','Diapers','Socks'
        };

        Test.startTest();
        MostNeededSupply uniqueItems = new MostNeededSupply();
        String mostNeededItem = uniqueItems.findMostNeededSupply(shoppingList);
        Test.stopTest();

        Assert.areEqual('Socks', mostNeededItem, 'Socks should have been the most needed item in the list.');
    }

    @IsTest
    static void twoItemTie() {
        List<String> shoppingList = new List<String>{
            'Hats','Socks','Hats','Diapers','Socks'
        };

        Test.startTest();
        MostNeededSupply uniqueItems = new MostNeededSupply();
        String mostNeededItem = uniqueItems.findMostNeededSupply(shoppingList);
        Test.stopTest();

        Assert.areEqual('Hats', mostNeededItem, 'Hats should have been the most needed item in the list.');
    }

    @IsTest
    static void blankItemsInList() {
        List<String> shoppingList = new List<String>{
            '','','Hats','Socks','Gloves'
        };

        Test.startTest();
        MostNeededSupply uniqueItems = new MostNeededSupply();
        String mostNeededItem = uniqueItems.findMostNeededSupply(shoppingList);
        Test.stopTest();

        Assert.areEqual('', mostNeededItem, 'There should be a blank String returned.');
        //Admittedly the code should be refactored so that blanks are NOT included,
        //but this was not part of the original code problem
    }

    @IsTest
    static void nullItemsInList() {
        List<String> shoppingList = new List<String>{
            null, 'Onesies', null, 'Swaddles'
        };

        Test.startTest();
        MostNeededSupply uniqueItems = new MostNeededSupply();
        String mostNeededItem = uniqueItems.findMostNeededSupply(shoppingList);
        Test.stopTest();

        Assert.areEqual(null, mostNeededItem, 'Should have returned a null value.');
        //Admittedly the code should be refactored so that nulls are NOT included,
        //but this was not part of the original code problem
    }

    @IsTest
    static void nullList() {
        List<String> shoppingList = new List<String>();

        Test.startTest();
        MostNeededSupply uniqueItems = new MostNeededSupply();
        String mostNeededItem = uniqueItems.findMostNeededSupply(shoppingList);
        Test.stopTest();

        //Refactor the code to throw an exception or handle when the list is null
    }
}