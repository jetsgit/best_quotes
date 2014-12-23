class QuotesController < Rulers::Controller

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" =>  "Every Picture Tells a Story",
      "attribution" =>  "Me"
    } 
    m = FileModel.create attrs
    render :quote, :obj => m
  end 

  def  a_quote
    render :a_quote, noun: :winking
  end

  def  quote_1
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def exception
    raise "It's a bad one!"
  end

  def  index
    quotes = FileModel.all
    render :index, quotes: quotes
  end

  def submitted_by(params)
    require 'pry'; binding.pry
    @author = []
    @author = FileModel.find_all_by_submitter(params["author"])
    require 'pry'; binding.pry
    if @author.empty?
      render :submitted_by, author: ( @author << "none" )
    else
      render :submitted_by, author: @author
    end
  end

  def update(params)
    @hash = {}
    cur_quote = FileModel.find(params["id"])
    binding.pry
    @hash["submitter"] = params["submitter"] || cur_quote["submitter"]
    @hash["quote"] = params["quote"] || cur_quote["quote"]
    @hash["attribution"] = params["attribution"] || cur_quote["attribution"]
    filename = cur_quote.instance_variable_get :@filename 
    FileModel.save filename, @hash
    render :quote, obj: @hash
  end

end
