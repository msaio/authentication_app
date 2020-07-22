class StaticController <  ApplicationController
  def home
    render json: { status: "Hello Motherfucker" }
  end
end
