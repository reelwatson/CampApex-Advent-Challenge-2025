
@isTest
private class CalculateThreadNeededTest {

    @isTest
    static void emptyNamesListTest() {
        // TO DO: assert return is 0
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        List<String> namesList = new List<String>();
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => 6, 'C' => 7};

        Test.startTest();
        Integer totalString = newThreadProject.calculateThreadNeeded(namesList, letterMap);
        Test.stopTest();
        Assert.areEqual(0, totalString, 'Because the list of names is empty the method should have returned 0.');
    }

    @IsTest
    static void positiveNamesListTest() {
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        List<String> namesList = new List<String>{'BABA'};
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => 6, 'C' => 7};
        Test.startTest();
        Integer totalString = newThreadProject.calculateThreadNeeded(namesList, letterMap);
        Test.stopTest();
        Assert.areEqual(22, totalString, 'The method should have returned 22, instead returned ' + totalString);

    }

    @IsTest
    static void unexpectedLetter() {
        // Throws when a letter in names is not in the map
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        List<String> namesList = new List<String>{'MAMA'}; // 'M' missing below
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => 6, 'C' => 7};

        Boolean CTNExceptionThrew = false;
        try {
            Test.startTest();
            newThreadProject.calculateThreadNeeded(namesList, letterMap);
            Test.stopTest();
        } catch (CalculateThreadNeededException ctne) {
            CTNExceptionThrew = true;
            System.assert(CTNExceptionThrew, 'Expected CalculateThreadNeededException to be thrown for unexpected letter.');
        }
    }

    @IsTest
    static void negativeOrZeroMapInteger() {
        // Throws when a corresponding map value is <= 0
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        List<String> namesList = new List<String>{'BABA'};
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => -6, 'C' => 7};

        Boolean CTNExceptionThrew = false;
        try {
            Test.startTest();
            newThreadProject.calculateThreadNeeded(namesList, letterMap);
            Test.stopTest();
        } catch (CalculateThreadNeededException ctne) {
            CTNExceptionThrew = true;
            System.assert(CTNExceptionThrew, 'Expected CalculateThreadNeededException to be thrown when thread length zero or negative.');
        }
    }

    @IsTest
    static void someNamesEmpty() {
        // Verifies custom exception is thrown at the blank/null name guard (line 21)
        CalculateThreadNeeded newThreadProject = new CalculateThreadNeeded();
        // Include a blank and a null to trigger the guard at the first inner-loop iteration
        List<String> namesList = new List<String>{'BABA', '', 'ABBA', null};
        Map<String, Integer> letterMap = new Map<String, Integer>{'A' => 5, 'B' => 6, 'C' => 7};

        Boolean CTNExceptionThrew = false;
        try {
            Test.startTest();
            newThreadProject.calculateThreadNeeded(namesList, letterMap);
            Test.stopTest();
        } catch (CalculateThreadNeededException ctne) {
            CTNExceptionThrew = true;
            System.assert(CTNExceptionThrew, 'Expected CalculateThreadNeededException to be thrown when a name is blank or null.');
        }
    }
}
