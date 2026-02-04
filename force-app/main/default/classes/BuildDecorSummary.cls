public with sharing class BuildDecorSummary {
    public String BuildDecorSummary(List<String> decorElements) {
        Map<String, Integer> decorMap = new Map<String, Integer>();
        
        // If decorElements empty, return ""
        String decorString = '';

        // If list is NOT empty, loop through each String of list
        if (decorElements != null && !decorElements.isEmpty()) {
            for (String decorElement : decorElements) {
                // Add each String to decorMap
                // Either add new key and count of 1
                // OR add count of 1 to existing key
                 if (decorMap.containsKey(decorElement)) {
                    decorMap.put(decorElement, decorMap.get(decorElement) + 1);
                } 
                else {
                    decorMap.put(decorElement, 1);
                }
            }

            // Loop through each key of decorMap
            for (String mapString : decorMap.keySet()) {
                // Add ", " + key + " x" + value to decorString for each key
                // Option to refactor: use String.join() and a List<String> to create the final string
                decorString += ', ' + mapString + ' x' + decorMap.get(mapString);
            }

            // Remove first ", " from decorString before returning
            decorString = decorString.removeStart(', ');
        }
        return decorString;
    }    
}


/*
Poppy Wintergold is tracking every festive decoration she adds 
to the baby's nursery wall – stars, snowflakes, tiny wreaths, and 
twinkling garlands – for the baby's first Christmas. 

She wants a simple one-line summary she can share with Grandma for an 
organized view of all Christmas decorations used, so everyone knows 
exactly how the nursery is decorated and can plan any extra festive 
touches that still match the decor. 🎄


Given a list of decoration labels in the order Poppy placed them, 
build a summary string that groups identical labels, 
counts how many times each appears, 
and lists them in the order they first appear.


Technical Specifications:

You are given a List<String> decorElements representing festive 
decorations in placement order (e.g., ['STAR', 'SNOWFLAKE', 'STAR', 'BOW']).

You must count how many times each distinct label appears.

The summary must list each distinct label 
in the order it first appears in decorElements.

Each item in the summary is formatted as: LABEL xCOUNT 
(for example, STAR x3).

Items are separated by a comma and a space: ", ".

If decorElements is empty, return the empty string "".

All strings in decorElements are non-null and may contain letters, 
digits, or underscores; you should treat labels as case-sensitive 
and preserve them exactly as given.



*/