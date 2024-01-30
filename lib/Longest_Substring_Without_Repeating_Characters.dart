class Solution {
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    Set<String> charSet = {};
    int leftPointer = 0;

    for (int rightPointer = 0; rightPointer < s.length; rightPointer++) {
      while (charSet.contains(s[rightPointer])) {
        charSet.remove(s[leftPointer]);
        leftPointer++;
      }

      charSet.add(s[rightPointer]);
      maxLength = maxLength > rightPointer - leftPointer + 1
          ? maxLength
          : rightPointer - leftPointer + 1;
    }

    return maxLength;
  }
}
