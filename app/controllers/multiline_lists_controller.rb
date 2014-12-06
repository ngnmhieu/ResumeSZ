class MultilineListsController < ApplicationController
  include OrderingMethods

  def create
    @resume = Resume.find(params[:resume_id])
    if @resume != nil
      order = @resume.num_items + 1
      list = MultilineList.new(order: order)
      @resume.multiline_lists << list

      if @resume.save
        respond_to do |format|
          format.html { redirect_to edit_resume_path(@resume) }
          format.json do
            form = nil
            view_context.form_for @resume do |r| 
              form = r 
            end
            render json: {
              'status' => 'success',
              'section_name' => list.name,
              'section_order' => list.order,
              'html'   => render_to_string(partial: 'resumes/multiline_list_form.html.erb', locals: {data: list, rform: form})
            }
          end
        end
      end
    end
  end

  def destroy
    list = MultilineList.find(params[:id])
    resume = Resume.find(params[:resume_id])
    list_order = list.order

    if list.destroy
      resume.refresh_ordering
      respond_to do |format|
        format.html { redirect_to edit_resume_path(params[:resume_id]) }
        format.json { render json: {status: 'success', msg: 'Section deleted', section_order: list_order} }
      end
    end

  end
end
