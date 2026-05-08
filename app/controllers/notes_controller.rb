class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reference_material
  before_action :set_note, only: [ :update, :destroy ]

  def create
    @note = @reference_material.notes.build(note_params)
    @note.user = current_user

    if @note.save
      redirect_to @reference_material, notice: "Заметка добавлена"
    else
      redirect_to @reference_material, alert: "Не удалось добавить заметку"
    end
  end

  def update
    if @note.update(note_params)
      redirect_to @reference_material, notice: "Заметка обновлена"
    else
      redirect_to @reference_material, alert: "Не удалось обновить заметку"
    end
  end

  def destroy
    @note.destroy
    redirect_to @reference_material, notice: "Заметка удалена"
  end

  private

  def set_reference_material
    @reference_material = Topic.find(params[:reference_id])
  end

  def set_note
    @note = @reference_material.notes.find_by!(
      id: params[:id],
      user: current_user
    )
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
