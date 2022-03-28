class WikiImages < Jekyll::Generator
  priority :highest
  def generate(site)

    all_notes = site.collections['notes'].docs

    all_docs = all_notes

    all_docs.each do |current_note|

      image_path = "/Attachments/"

      # This will only ever work for image paths like ![[image.png]] and the images have
      # to be located in the /Attatchments folder (not the one in _notes, the one in the
      # root). I should probably make this export the images automatically, but I have no
      # clue how to actually do that...
      current_note.content = current_note.content.gsub(
        /
        !\[\[ # Starting with ![[
        (?!assets)(?!\/assets) # Exclude embeds with assets path
        ([^\]]+) # Capture entire filename
        \]\] # Make sure it ends in ]]
        (?!`$) # Exclude codeblocks ending in `
        /x,
        '<img src="' + image_path + '\1">'
      )


    end
  end
end
