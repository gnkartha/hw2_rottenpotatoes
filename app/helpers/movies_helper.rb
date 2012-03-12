module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  def title_hilite
    sorting_key = params[:sort_by]
    if (sorting_key == "title")
     if @release_hilite == true
       @release_hilite = false
     end
     @title_hilite = true
    end
    if @title_hilite
      return "hilite"
    else
      return ""
    end
  end
  def release_hilite
    sorting_key = params[:sort_by]
    if (sorting_key == "release_date")
     if @title_hilite == true
       @title_hilite = false
     end
     @release_hilite = true
    end
    if @release_hilite
      return "hilite"
    else
      return ""
    end
  end
end
