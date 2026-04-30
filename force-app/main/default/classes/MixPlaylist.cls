public with sharing class MixPlaylist {
    public List<String> mixPlaylist(List<String> carols, List<String> lullabies, String pattern, Integer playlistLength) {
        // Your solution here

        List<String> playList = new List<String>();

        if (carols == null || carols.isEmpty() || lullabies == null || lullabies.isEmpty()) {
            return playList;
        }

        pattern.toLowerCase();

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
                // Use module to loop through carols and add to playList
                // playList.add(carols[Math.mod(i, carols.size())]) ??
            }
            else if (pattern.charAt(i) == 'l') {
                // Use module to loop through lullabies and add to playList
            }
        }

        return playList;
    }
}