def longest_palindromimc_substring(s)
	lps = ""
    (0...s.length).each do |i|
        (i+1...s.length).each do |j|
            lps = s[i..j] if s[i..j] == s[i..j].reverse && s[i..j].length > lps.length
        end
    end
    return nil if lps.length == 0
    return lps
end

p longest_palindromimc_substring("babad")
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:
p longest_palindromimc_substring("cbbd")
# Output: "bb"
# Example 3:
p longest_palindromimc_substring("abcd")
# Output: nil / Output: “”
