
@isTest
private class DistributeCookiesTest {

    //TO DO: replace "expected, actual, msg) in assert statements for each test

    @isTest
    static void zeroCookiesTest() {
       //TO DO: Refactor code to alert end user that number of zookies is zero?
       Integer totalCookies = 0;
        List<String> helpers = new List<String>{
            'Janie','Danzey','Bill','Rob'
        };

        Test.startTest();
        Map<String, Object> remainingCookiesMap = DistributeCookies.distributeCookies(totalCookies, helpers);
        Test.stopTest();

        //Assert that value (cookies) from first key is zero
        Assert.areEqual(0, (Integer) remainingCookiesMap.get('cookiesPerPerson'));

        //Assert that value (cookies) from second key is zero
        Assert.areEqual(0, (Integer) remainingCookiesMap.get('leftoverForParents'));
        
        Map<String, Integer> distribution = (Map<String, Integer>) remainingCookiesMap.get('distribution');
        //Assert that size of distribution list (# of helpers) is 4
        Assert.areEqual(4, distribution.size());
        // Assert that value (cookies) of each helper is zero 
        for (String helper : helpers) {
            Assert.areEqual(0, distribution.get(helper));
        }
    }

    @IsTest
    static void nullCookiesTest() {
        //Would need to refactor code to alert end user that no value was passed in for cookies - should pass in number >= 1 ideally but >= 0 minimum
        //Not part of original scenario
        Integer totalCookies;
        List<String> helpers = new List<String>{
            'Janie','Danzey','Bill','Rob'
        };

        Test.startTest();
        Map<String, Object> remainingCookiesMap = DistributeCookies.distributeCookies(totalCookies, helpers);
        Test.stopTest();

        //Include assert of Exception, that correct if/else statement was followed, or that error message was shown to end user
    }

    @IsTest
    static void remainingCookiesTest() {
        Integer totalCookies = 10;
        List<String> helpers = new List<String>{
            'Janie','Danzey','Bill','Rob'
        };

        Test.startTest();
        Map<String, Object> remainingCookiesMap = DistributeCookies.distributeCookies(totalCookies, helpers);
        Test.stopTest();

        //Assert that value (cookies) from first key is 2
        Assert.areEqual(2, (Integer) remainingCookiesMap.get('cookiesPerPerson'));

        //Assert that value (cookies) from second key is 2
        Assert.areEqual(2, (Integer) remainingCookiesMap.get('leftoverForParents'));
        
        Map<String, Integer> distribution = (Map<String, Integer>) remainingCookiesMap.get('distribution');
        //Assert that size of distribution list (# of helpers) is 4
        Assert.areEqual(4, distribution.size());
        // Assert that value (cookies) of each helper is 2 
        for (String helper : helpers) {
            Assert.areEqual(2, distribution.get(helper));
        }
        
    }

    @IsTest
    static void noRemainingCookiesTest() {
        Integer totalCookies = 8;
        List<String> helpers = new List<String>{
            'Janie','Danzey','Bill','Rob'
        };

        Test.startTest();
        Map<String, Object> remainingCookiesMap = DistributeCookies.distributeCookies(totalCookies, helpers);
        Test.stopTest();

        //Assert that value (cookies) from first key is 2
        Assert.areEqual(2, (Integer) remainingCookiesMap.get('cookiesPerPerson'));

        //Assert that value (cookies) from second key is 0
        Assert.areEqual(0, (Integer) remainingCookiesMap.get('leftoverForParents'));
        
        Map<String, Integer> distribution = (Map<String, Integer>) remainingCookiesMap.get('distribution');
        //Assert that size of distribution list (# of helpers) is 4
        Assert.areEqual(4, distribution.size());
        // Assert that value (cookies) of each helper is 2 
        for (String helper : helpers) {
            Assert.areEqual(2, distribution.get(helper));
        }
    }

    @IsTest
    static void moreHelpersThanCookiesTest() {
        //Actually need to refactor code to handle a situation like this??
        //Or would it just assign 0 cookies to helpers and 3 as leftoverForParents??
        
        Integer totalCookies = 3;
        List<String> helpers = new List<String>{
            'Janie','Danzey','Bill','Rob'
        };

        Test.startTest();
        Map<String, Object> remainingCookiesMap = DistributeCookies.distributeCookies(totalCookies, helpers);
        Test.stopTest();

        //Assert that value (cookies) from first key is 0
        Assert.areEqual(0, (Integer) remainingCookiesMap.get('cookiesPerPerson'));

        //Assert that value (cookies) from second key is 3
        Assert.areEqual(3, (Integer) remainingCookiesMap.get('leftoverForParents'));
        
        Map<String, Integer> distribution = (Map<String, Integer>) remainingCookiesMap.get('distribution');
        //Assert that size of distribution list (# of helpers) is 4
        Assert.areEqual(4, distribution.size());
        // Assert that value (cookies) of each helper is 3 
        for (String helper : helpers) {
            Assert.areEqual(3, distribution.get(helper));
        }
    }

    @IsTest
    static void helpersListHasNullsTest() {
        //Would need to refactor code to handle this situation
        //Not part of original scenario
        Integer totalCookies = 10;
        List<String> helpers = new List<String>{
            'Janie', null,'Bill','Rob'
        };

        Test.startTest();
        Map<String, Object> remainingCookiesMap = DistributeCookies.distributeCookies(totalCookies, helpers);
        Test.stopTest();

        //Assert that exception thrown, if/else branch followed correctly, or error shown to end user
    }

    @IsTest
    static void helpersListIsNull() {
        //Would need to refactor code to handle this situation
        //Not part of original scenario
        Integer totalCookies = 10;
        List<String> helpers = new List<String>();

        Test.startTest();
        Map<String, Object> remainingCookiesMap = DistributeCookies.distributeCookies(totalCookies, helpers);
        Test.stopTest();

        //Assert that exception thrown, if/else branch followed correctly, or error shown to end user
    }


}