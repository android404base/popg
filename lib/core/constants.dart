/// IGDB API client id header key
const String clientIdKey = 'Client-ID';

/// IGDB API client id header value
const String clientIdValue = 'ikefu3gjaojsnnt21ik7orxyofnztq';

/// IGDB API authorization header key
const String authKey = 'Authorization';

/// IGDB API authorization header value
const String authValue = 'Bearer db5jrhvb88qx4pu14rhhun808agffp';

/// https addition
const String httpsAdd = 'https:';

/// IGDB API base url
const String baseUrl = '//api.igdb.com/v4/games';

/// IGDB API requestBody
const String requestBody =
    'fields name,summary,storyline,url,cover.url,rating; '
    'where name != null & summary != null & storyline != null & '
    'url != null & cover.url != null & rating != null; '
    'limit 10; ';

/// [ServerFailure] error message
const serverFailureMessage = 'ServerFailure';

/// [CacheFailure] error message
const cacheFailureMessage = 'CacheFailure';
