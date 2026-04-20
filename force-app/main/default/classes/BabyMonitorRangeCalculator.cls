public with sharing class BabyMonitorRangeCalculator {
    public List<String> calculateMonitorCoverage(List<Integer> monitorPosition, Integer range, Map<String, List<Integer>> rooms) {
        /*
        Create empty List<String> inRangeRooms
        Assign first integer in monitorPosition to x1
        Assign second integer in monitorPosition to y1
        For Each room listed in "rooms" Map:
            Assign first integer in room to x2
            Assign second integer in room to y2
            Calculate distance using Euclidean distance formula: sqrt((x2-x1)² + (y2-y1)²)
            IF distance <= range, add room (String) to inRangeRooms
        Sort List<String> of inRangeRooms alphabetically
        Return List<String>
        */

        List<String> inRangeRooms = new List<String>();
        try {
            if (range <= 0) {
                throw new CustomExceptions.BabyMonitorException('The range of the monitor cannot be less than 1.');
            }
            else if (rooms.isEmpty()) {
                throw new CustomExceptions.BabyMonitorException('The list of rooms cannot be empty!');
            }
            else {
                Integer x1 = monitorPosition[0];
                Integer y1 = monitorPosition[1];
                if (x1 == null || y1 == null) {
                    throw new CustomExceptions.BabyMonitorException('Your room is missing one or both coordinates');
                }
                else {
                    for (String room : rooms.keySet()) {
                        // Can I use safe navigation here? hm
                        Integer x2 = rooms.get(room)[0];
                        Integer y2 = rooms.get(room)[1];
                        if (x2 == null || y2 == null) {
                            throw new CustomExceptions.BabyMonitorException('One of your rooms is missing one or both coordinates');
                        }
                        else {
                            Double distance = Math.sqrt(Math.pow((x2 - x1), 2) + Math.pow(y2 - y1, 2));
                            if (distance <= range) {
                                inRangeRooms.add(room);
                            }
                        }
                    }
                }
                inRangeRooms.sort();
            }
        }
        catch (CustomExceptions.BabyMonitorException bme) {
            System.debug(bme.getMessage());
        }
        catch (Exception e) {
            System.debug(e.getMessage());
        }
        return inRangeRooms;
    }
}

// Use the Euclidean distance formula: sqrt((x2-x1)² + (y2-y1)²)
// A room is within range if distance <= range
// Coordinates can be negative
// Return an empty list if no rooms are in range
// Sort room names alphabetically

// Finn Brightwick is installing a baby monitor with a specific range radius. He needs to ensure it covers all the important rooms in the house. 📡


// Given the monitor's position (x, y), its range radius, and a list of room coordinates, determine which rooms are within range.


// Your method receives:

// monitorPosition (List): [x, y] coordinates of the monitor
// range (Integer): radius of the monitor's signal
// rooms (Map<String, List>): map of room names to their [x, y] coordinates
// Return a List of room names that are within range, sorted alphabetically.


// Example 1:
// Input: monitorPosition = [0, 0], range = 5, rooms = {'Nursery' => [3, 4], 'Kitchen' => [6, 0], 'Bedroom' => [0, 5]}
// Output: ['Bedroom', 'Nursery']
// **Explanation**: Distance to Nursery = sqrt(3² + 4²) = 5 (within range). Kitchen = 6 (out of range). Bedroom = 5 (within range).



// Example 2:
// Input: monitorPosition = [5, 5], range = 3, rooms = {'Bathroom' => [8, 5], 'Office' => [5, 7], 'Closet' => [6, 6]}
// Output: ['Closet', 'Office']
// **Explanation**: Bathroom distance = 3, but sqrt((8-5)² + (5-5)²) = 3 exactly (within range as <=). Office = sqrt(0 + 4) = 2. Closet = sqrt(1 + 1) = 1.41.



// Example 2 (Corrected):
// Input: monitorPosition = [5, 5], range = 3, rooms = {'Bathroom' => [8, 5], 'Office' => [5, 7], 'Closet' => [6, 6]}
// Output: ['Bathroom', 'Closet', 'Office']
// **Explanation**: Bathroom = 3 (exactly at range). Office = 2. Closet = 1.41. All within range.



// Example 3:
// Input: monitorPosition = [0, 0], range = 1, rooms = {'Living Room' => [10, 10]}
// Output: []
// **Explanation**: Living Room distance = sqrt(200) ≈ 14.14, far out of range.



// Example 4:
// Input: monitorPosition = [3, 3], range = 10, rooms = {'Room A' => [0, 0], 'Room B' => [6, 6], 'Room C' => [3, 3]}
// Output: ['Room A', 'Room B', 'Room C']
// **Explanation**: All rooms within large range. Room C is at exact monitor position (distance 0).