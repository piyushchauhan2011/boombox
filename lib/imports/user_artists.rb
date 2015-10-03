parsed_ua = TSV.parse_file('/Users/kartikeychauhan/Documents/college/COMP5338 Advanced Data Models/hetrec2011-lastfm-2k-2/user_artists.dat').with_header

parsed_ua.each do |x|
  u = User.find_or_create_by(userID: x[0].to_i)
  u.artists.create({
    artistID: x[1].to_i,
    weight: x[2].to_i
    })
  u.save
end
