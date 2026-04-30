public with sharing class MixPlaylist {
    public List<String> mixPlaylist(List<String> carols, List<String> lullabies, String pattern, Integer playlistLength) {
        // Your solution here

        List<String> playList = new List<String>();

        if (carols == null || carols.isEmpty() || lullabies == null || lullabies.isEmpty()) {
            return playList;
        }

        pattern = pattern.toLowerCase();

        Integer carolIndex = 0;
        Integer lullabyIndex = 0;
        // You use the index rather than Integer i to loop through each list without skipping any entries

        for (Integer i = 0; i < playlistLength; i++) {
            if (pattern.charAt(i) != 'c' && pattern.charAt(i) != 'l') {
                return new List<String>();
            }
            /*
            Tricky part: songs cycle within their list,
            aka index wraps around when end is reached
            And pattern repeats cyclically until playlistLength is reached
            */
            else if (pattern.charAt(i) == 'c') {
                // Use modulo to loop through carols and add to playList
                playList.add(carols[Math.mod(carolIndex, carols.size())]);
                carolIndex++;
            }
            else if (pattern.charAt(i) == 'l') {
                // Use modulo to loop through lullabies and add to playList
                playList.add(lullabies[Math.mod(lullabyIndex, lullabies.size())]);
                lullabyIndex++;
            }
        }

        return playList;
    }
}