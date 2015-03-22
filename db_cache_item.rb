class DbCacheItem < ActiveRecord::Base
  def self.get(key, valid_for: 1.month)
    DbCacheItem.where(["key = ? and created_at < ?", key, DateTime.now - valid_for]).map(&:destroy)
    item = DbCacheItem.find_or_initialize_by(key: key)
    if item.new_record?
      item.value = yield
      item.save if item.value.present?
    end
    return item.value
  end
end