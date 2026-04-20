
@isTest
private class BabyMonitorRangeCalculatorTest {

    @isTest
    static void allRoomsInRange() {
        List<Integer> monitorPosition = new List<Integer>{4, 5};
        Integer range = 8;
        Map<String, List<Integer>> rooms = new Map<String, List<Integer>>{
            'Living Room' => new List<Integer>{6, 8},
            'Kitchen' => new List<Integer>{1, 5},
            'Master Bedroom' => new List<Integer>{3, 7}
        };
        BabyMonitorRangeCalculator newMonitor = new BabyMonitorRangeCalculator();
        List<String> expectedList = new List<String>{'Kitchen', 'Living Room', 'Master Bedroom'};

        Test.startTest();
        List<String> actualList = newMonitor.calculateMonitorCoverage(monitorPosition, range, rooms);
        Test.stopTest();

        Assert.areEqual(expectedList, actualList, 'The method should have returned Kitchen, Living Room, and Master Bedroom in that order. Instead returned ' + actualList);

    }

    @IsTest
    static void someRoomsInRange() {
        List<Integer> monitorPosition = new List<Integer>{4, 5};
        Integer range = 3;
        Map<String, List<Integer>> rooms = new Map<String, List<Integer>>{
            'Living Room' => new List<Integer>{7, 10},
            'Kitchen' => new List<Integer>{1, 5},
            'Master Bedroom' => new List<Integer>{3, 7}
        };
        BabyMonitorRangeCalculator newMonitor = new BabyMonitorRangeCalculator();
        List<String> expectedList = new List<String>{'Kitchen', 'Master Bedroom'};

        Test.startTest();
        List<String> actualList = newMonitor.calculateMonitorCoverage(monitorPosition, range, rooms);
        Test.stopTest();

        Assert.areEqual(expectedList, actualList, 'The method should have returned Kitchen and Master Bedroom in that order. Instead returned ' + actualList);

    }

    @IsTest
    static void noRoomsInRange() {
        List<Integer> monitorPosition = new List<Integer>{4, 5};
        Integer range = 1;
        Map<String, List<Integer>> rooms = new Map<String, List<Integer>>{
            'Living Room' => new List<Integer>{7, 10},
            'Kitchen' => new List<Integer>{1, 5},
            'Master Bedroom' => new List<Integer>{8, 7}
        };
        BabyMonitorRangeCalculator newMonitor = new BabyMonitorRangeCalculator();
        List<String> expectedList = new List<String>();

        Test.startTest();
        List<String> actualList = newMonitor.calculateMonitorCoverage(monitorPosition, range, rooms);
        Test.stopTest();

        Assert.areEqual(expectedList, actualList, 'The method should have returned an empty list. Instead returned ' + actualList);

    }

    @IsTest
    static void negativeCoordinates() {
        List<Integer> monitorPosition = new List<Integer>{4, 5};
        Integer range = 8;
        Map<String, List<Integer>> rooms = new Map<String, List<Integer>>{
            'Living Room' => new List<Integer>{6, 8},
            'Kitchen' => new List<Integer>{1, 5},
            'Master Bedroom' => new List<Integer>{-3, 7}
        };
        BabyMonitorRangeCalculator newMonitor = new BabyMonitorRangeCalculator();
        List<String> expectedList = new List<String>{'Kitchen', 'Living Room', 'Master Bedroom'};

        Test.startTest();
        List<String> actualList = newMonitor.calculateMonitorCoverage(monitorPosition, range, rooms);
        Test.stopTest();

        Assert.areEqual(expectedList, actualList, 'The method should have returned Kitchen, Living Room, and Master Bedroom in that order. Instead returned ' + actualList);

    }

    @IsTest
    static void monitorPositionListHasNulls() {
        List<Integer> monitorPosition = new List<Integer>{4, null};
        Integer range = 8;
        Map<String, List<Integer>> rooms = new Map<String, List<Integer>>{
            'Living Room' => new List<Integer>{6, 8},
            'Kitchen' => new List<Integer>{1, 5},
            'Master Bedroom' => new List<Integer>{3, 7}
        };
        BabyMonitorRangeCalculator newMonitor = new BabyMonitorRangeCalculator();
        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            
            List<String> actualList = newMonitor.calculateMonitorCoverage(monitorPosition, range, rooms);
            Assert.fail('The method should have thrown an Exception here. Actual list: ' + actualList);
        }
        catch (CustomExceptions.BabyMonitorException bme) {
            exceptionThrown = true;
            Assert.isTrue(exceptionThrown, 'Expected BabyMonitorException to be thrown when monitorPosition list has null entries.');        
        }
        Test.stopTest();
    }

    @IsTest
    static void rangeNullOrLessThanOne() {
        // Throws an exception
        // Fun exception message: 'Monitor broken, send back to manufacturer'
    }

    @IsTest
    static void roomsMapIsEmpty() {
        // Throws an exception
        // Fun exception message: You testing this monitor in a field or something?
    }

    @IsTest
    static void roomsMapHasNullValues() {
        // Throws an exception
        // Exception message: Did your house beome one-dimensional?    
    }
}