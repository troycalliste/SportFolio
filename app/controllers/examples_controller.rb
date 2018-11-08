class ExamplesController < InheritedResources::Base

  private

    def example_params
      params.require(:example).permit()
    end
end

