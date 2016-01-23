# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class EditorChannel < ApplicationCable::Channel
  def subscribed
    stream_from "editor_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def source(data)
    source = Source.find(data["id"])
    languages = Language.all.order(:name)
    ActionCable.server.broadcast "editor_channel", source: render_editor(source, languages)
  end

  def new
    source = Source.new
    languages = Language.all.order(:name)
    ActionCable.server.broadcast "editor_channel", source: render_editor(source, languages)
  end

  def save(data)
    ActiveRecord::Base.transaction do
      source = Source.find_by_id(data["id"])
      if source
        source.update!(source_params(data))
      else
        Source.create!(source_params(data))
      end
    end
    sources = Source.all.order(:name)
    ActionCable.server.broadcast "editor_channel", sources: render_sources(sources)
  end

  def remove(data)
    source = Source.find_by_id(data["id"])
    if source
      ActiveRecord::Base.transaction do
        source.destroy!
      end
      sources = Source.all
      ActionCable.server.broadcast "editor_channel", sources: render_sources(sources)
    end
  end

  private

    def source_params(data)
      ActionController::Parameters.new(data)
        .permit(:id, :name, :code, :language_id)
    end

    def render_sources(sources)
      ApplicationController.renderer.render(partial: "editors/sources", locals: { sources: sources })
    end

    def render_editor(source, languages)
      ApplicationController.renderer.render(partial: "editors/editor", locals: { source: source, languages: languages })
    end
end
