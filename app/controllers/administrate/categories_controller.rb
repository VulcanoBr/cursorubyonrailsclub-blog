module Administrate
  class CategoriesController < AdministrateController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
    #before_action :set_categories, only: [:new, :show, :edit]

    # GET /Categories or /Categories.json
    def index
      @categories = Category.all
    end

    # GET /Categories/1 or /Categories/1.json
    def show
    end

    # GET /Categories/new
    def new
      @category = Category.new
    end

    # GET /Categories/1/edit
    def edit
    end

    # POST /Categories or /Categories.json
    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to(administrate_category_url(@category), notice: "Category was successfully created.") }
          format.json { render(:show, status: :created, location: @category) }
        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @category.errors, status: :unprocessable_entity) }
        end
      end
    end

    # PATCH/PUT /Categories/1 or /Categories/1.json
    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to(administrate_category_url(@category), notice: "Category was successfully updated.") }
          format.json { render(:show, status: :ok, location: @category) }
        else
          format.html { render(:edit, status: :unprocessable_entity) }
          format.json { render(json: @category.errors, status: :unprocessable_entity) }
        end
      end
    end

    # DELETE /Categories/1 or /Categories/1.json
    def destroy
      @category.destroy!

      respond_to do |format|
        format.html { redirect_to(administrate_categories_url, notice: "Category was successfully destroyed.") }
        format.json { head(:no_content) }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_category
     # @category = Category.friendly.find(params[:id])
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
  end
end
