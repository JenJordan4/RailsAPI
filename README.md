# README

This API provides paginated results for your search of a list of fictional apps.

### To Display
The `by` parameter specifies which field to sort the information by. It can be either: 
  - `id` (an integer)
  - `name` (a string)

For example: A GET request of `/apps?range[by]=id` will return the results organized by ID numbers.

### Order
The `order` parameter organizes the returned items by either ascending or descending order.
The default is ascending. If you would like descending, set the `order` parameter to `desc`.

For example: A GET request of `/apps?range[by]=id&range[order]=desc` will return the results organized by ID in descending order.

### Page Size
You can specify the range of items to return using the `start` and `end` parameters. If you leave these parameters blank, the default `start` will be the first item in the API, and it will return the maximum amount for the page.

For example: If you enter `10` as the start and `29` as the end, only 20 items will display, starting from the 10th item in the API. If you enter nothing, it will show the first 50 items in the API.

### Maximum Page Size
The API returns a default maximum of 50 items. The `max` parameter can be used to change this.

For example: A GET request of `localhost:3000/apps?range[by]=id&range[max]=5` will return 5 items at a time.