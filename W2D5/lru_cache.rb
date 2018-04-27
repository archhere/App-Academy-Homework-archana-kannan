class LRUCache

    def initialize(max_cache_size)
      @max_cache_size = max_cache_size
      @cache_value = []
    end

    def count
      # returns number of elements currently in cache
      @cache_value.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache_value.include?(el)
        @cache_value.delete(el)
        @cache_value << el
      elsif
        count > @max_cache_size
        @cache_value.shift
        @cache_value << el
      else
        @cache_value << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache_value
    end

    private
    # helper methods go here!

  end
