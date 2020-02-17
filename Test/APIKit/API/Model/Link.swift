/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct Link : Codable {
	public let selfLink : SelfLink?
	public let html : Html?
	public let issue : Issue?
	public let comments : Comments?
	public let review_comments : Review_comments?
	public let review_comment : Review_comment?
	public let commits : Commits?
	public let statuses : Statuses?

	enum CodingKeys: String, CodingKey {

		case selfLink = "self"
		case html = "html"
		case issue = "issue"
		case comments = "comments"
		case review_comments = "review_comments"
		case review_comment = "review_comment"
		case commits = "commits"
		case statuses = "statuses"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		selfLink = try values.decodeIfPresent(SelfLink.self, forKey: .selfLink)
		html = try values.decodeIfPresent(Html.self, forKey: .html)
		issue = try values.decodeIfPresent(Issue.self, forKey: .issue)
		comments = try values.decodeIfPresent(Comments.self, forKey: .comments)
		review_comments = try values.decodeIfPresent(Review_comments.self, forKey: .review_comments)
		review_comment = try values.decodeIfPresent(Review_comment.self, forKey: .review_comment)
		commits = try values.decodeIfPresent(Commits.self, forKey: .commits)
		statuses = try values.decodeIfPresent(Statuses.self, forKey: .statuses)
	}

}
