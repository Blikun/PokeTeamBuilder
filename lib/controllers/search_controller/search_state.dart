part of 'search_controller.dart';

class SearchFilterState {

    Rx<SearchModel?> searchParameters = Rx<SearchModel?>(null);

    /// Search results repository
    Rx<IndexModel?> searchResults = Rx<IndexModel?>(null);

}
