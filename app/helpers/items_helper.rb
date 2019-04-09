module ItemsHelper
  def item_photo(item)
    return item.photo.url if item.photo?
    asset_url('item_photo.jpg')
  end

  def item_thumb(item)
    return item.photo.thumb.url if item.photo.file.present?
    asset_url('item_thumb.jpg')
  end

  def item_price(item)
    price = (format '%.2f', item.price / 100.0)
    kop = price.slice!(-3..-1).delete('.')
    rub = price.reverse.split('').each_slice(3).map(&:join).join(' ').reverse
    "#{rub},#{kop} ₽"
  end

  def item_description(item)
    return item.description if item.description.present?
    'Описание товара находится в разработке'
  end

  def category_name(item)
    return item.category.name if item.category.present?
    'Товары без категорий'
  end

  def item_category(item)
    return item.category if item.category.present?
    uncategorized_url
  end
end
