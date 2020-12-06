passports = File.read("puzzle4/input-puzzle4.txt").split("\n\n")
valid_pass_count = 0
valid_fields_count = 0

passports.each do |pass|

  if pass.match?(/\bbyr:/) && pass.match?(/\biyr:/) && pass.match?(/\beyr:/) && pass.match?(/\bhgt:/) && pass.match?(/\bhcl:/) && pass.match?(/\becl:/) && pass.match?(/\bpid:/)
    
    valid_pass_count += 1
    byr_valid = pass.match(/\bbyr:(\d{4})\b/).captures[0].to_i.between?(1920, 2002)
    iyr_valid = pass.match(/\biyr:(\d{4})\b/).captures[0].to_i.between?(2010, 2020)
    eyr_valid = pass.match(/\beyr:(\d{4})\b/).captures[0].to_i.between?(2020, 2030)
    hcl_valid = pass.match?(/\bhcl:#[0-9a-f]{6}\b/)
    ecl_valid = pass.match?(/\becl:(amb|blu|brn|gry|grn|hzl|oth)\b/)
    pid_valid = pass.match?(/\bpid:\d{9}\b/)

    if pass.match?(/\bhgt:(\d+)(in|cm)\b/)
      hgt_match = pass.match(/\bhgt:(\d+)(in|cm)\b/).captures

      if hgt_match[1] == "in"

        hgt_valid = hgt_match[0].to_i.between?(59, 76)

      elsif hgt_match[1] == "cm"

        hgt_valid = hgt_match[0].to_i.between?(150, 193)
      
      end
    else
      hgt_valid = false
    end

    if byr_valid && iyr_valid && eyr_valid && hcl_valid && ecl_valid && pid_valid && hgt_valid

      valid_fields_count += 1

    end

  end

end

puts valid_pass_count
puts valid_fields_count