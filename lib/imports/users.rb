parsed_uta = TSV.parse_file('/Users/kartikeychauhan/Documents/college/COMP5338 Advanced Data Models/hetrec2011-lastfm-2k-2/user_taggedartists.dat').without_header

parsed_uta.each do |x|
  if x[0] === 'userID' then
    next
  end

  User.find_or_create_by(userID: x[0].to_i)
end
