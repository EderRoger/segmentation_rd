# encoding: utf-8

class QueryBuildersController < ApplicationController
  before_action :set_query, only: [:show, :edit, :update, :destroy]

  def index
    @query_builders = QueryBuilder.all
  end

  def new
    @query_builder = QueryBuilder.new
  end

  def edit
  end

  def show
  end

  def create
    p query_params
    @query_builder = QueryBuilder.new(query_params)
    # condition_array = [@query.to_json(query_params)]
    @query_builder.condition = [@query_builder.to_json(query_params)]

    if @query_builder.save
      redirect_to @query_builder, notice: 'Query was successfully created.'
    else
      render :new
    end
  end

  def update
    if @query_builder.update(query_params)
      redirect_to @query_builder, notice: 'Query was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @query_builder.destroy
    redirect_to query_builders_url, notice: 'Query was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_query
      @query_builder = QueryBuilder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def query_params
      params.require(:query_builder).permit(:name, :condition, :field, :operator, :agregator, :value)
    end
end
