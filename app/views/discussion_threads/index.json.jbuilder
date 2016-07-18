json.array!(@discussion_threads) do |discussion_thread|
  json.extract! discussion_thread, :id, :title, :body
  json.url discussion_thread_url(discussion_thread, format: :json)
end
