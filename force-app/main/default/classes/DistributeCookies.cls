public with sharing class DistributeCookies {
    public Map<String, Object> distributeCookies(Integer totalCookies, List<String> helpers) {
        // Your solution here
        Map<String, Object> cookiesMap = new Map<String, Object>();
        
        
        
        
        
        
        return cookiesMap;
    }
}

/*

Given a total number of cookies and a list of helper names, 
divide the cookies evenly. Any leftover cookies will be saved for Mama and Papa.


Your method receives:

totalCookies (Integer): total cookies baked
helpers (List): names of people receiving cookies
Return a Map<String, Object> containing:

'cookiesPerPerson' (Integer): how many cookies each helper gets
'leftoverForParents' (Integer): remaining cookies for Mama and Papa
'distribution' (Map<String, Integer>): map of each helper name to their cookie count

Example 1:
Input: totalCookies = 20, helpers = ['Stella', 'Finn', 'Ivy']
Output:
{
  'cookiesPerPerson' => 6,
  'leftoverForParents' => 2,
  'distribution' => {'Stella' => 6, 'Finn' => 6, 'Ivy' => 6}
}

Notes:
Use integer division: cookiesPerPerson = totalCookies / helpers.size()
Use modulo for remainder: leftoverForParents = totalCookies % helpers.size()
All helpers receive equal amounts (no favoritism!)
totalCookies will be non-negative
helpers list will have at least one name
*/