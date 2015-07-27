json.fileId @doc.id.to_s

json.fileType "document"

json.versionId "1"

json.meta do
    json.attribution @doc.attribution
    json.keywords @doc.keywords
    json.modified 1376412865000
    json.textDirection "ltr"
    json.textLanguage "en"
    json.title @doc.title
end

json.data do
    json.sections @doc.sections do |section|
        json.extract! section, :title, :content
    end
end

json.rel do
    json.affiliated []
    json.embedded []
end

json.url url_for(@doc)