class RanksController < ApplicationController
    def index
         @rank_cooks = Cook.order(impressions_count: 'DESC')
    end
end