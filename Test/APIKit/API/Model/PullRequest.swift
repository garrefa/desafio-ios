/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct PullRequest : Codable {
	public let url : String?
	public let id : Int?
	public let node_id : String?
	public let html_url : String?
	public let diff_url : String?
	public let patch_url : String?
	public let issue_url : String?
	public let number : Int?
	public let state : String?
	public let locked : Bool?
	public let title : String?
	public let user : UserLight?
	public let body : String?
	public let created_at : String?
	public let updated_at : String?
	public let closed_at : String?
	public let merged_at : String?
	public let merge_commit_sha : String?
	public let assignee : UserLight?
	public let assignees : [UserLight]?
	public let requested_reviewers : [UserLight]?
	public let requested_teams : [String]?
	public var labels : [Dictionary<String, String>]?
	public var milestone : Dictionary<String, String>?
	public let commits_url : String?
	public let review_comments_url : String?
	public let review_comment_url : String?
	public let comments_url : String?
	public let statuses_url : String?
	public let head : Head?
	public let base : Base?
	public let _links : Link?
	public let author_association : String?

	enum CodingKeys: String, CodingKey {

		case url = "url"
		case id = "id"
		case node_id = "node_id"
		case html_url = "html_url"
		case diff_url = "diff_url"
		case patch_url = "patch_url"
		case issue_url = "issue_url"
		case number = "number"
		case state = "state"
		case locked = "locked"
		case title = "title"
		case user = "user"
		case body = "body"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case closed_at = "closed_at"
		case merged_at = "merged_at"
		case merge_commit_sha = "merge_commit_sha"
		case assignee = "assignee"
		case assignees = "assignees"
		case requested_reviewers = "requested_reviewers"
		case requested_teams = "requested_teams"
		case labels = "labels"
		case milestone = "milestone"
		case commits_url = "commits_url"
		case review_comments_url = "review_comments_url"
		case review_comment_url = "review_comment_url"
		case comments_url = "comments_url"
		case statuses_url = "statuses_url"
		case head = "head"
		case base = "base"
		case _links = "_links"
		case author_association = "author_association"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		node_id = try values.decodeIfPresent(String.self, forKey: .node_id)
		html_url = try values.decodeIfPresent(String.self, forKey: .html_url)
		diff_url = try values.decodeIfPresent(String.self, forKey: .diff_url)
		patch_url = try values.decodeIfPresent(String.self, forKey: .patch_url)
		issue_url = try values.decodeIfPresent(String.self, forKey: .issue_url)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		locked = try values.decodeIfPresent(Bool.self, forKey: .locked)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		user = try values.decodeIfPresent(UserLight.self, forKey: .user)
		body = try values.decodeIfPresent(String.self, forKey: .body)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		closed_at = try values.decodeIfPresent(String.self, forKey: .closed_at)
		merged_at = try values.decodeIfPresent(String.self, forKey: .merged_at)
		merge_commit_sha = try values.decodeIfPresent(String.self, forKey: .merge_commit_sha)
		assignee = try values.decodeIfPresent(UserLight.self, forKey: .assignee)
		assignees = try values.decodeIfPresent([UserLight].self, forKey: .assignees)
		requested_reviewers = try values.decodeIfPresent([UserLight].self, forKey: .requested_reviewers)
		requested_teams = try values.decodeIfPresent([String].self, forKey: .requested_teams)
		commits_url = try values.decodeIfPresent(String.self, forKey: .commits_url)
		review_comments_url = try values.decodeIfPresent(String.self, forKey: .review_comments_url)
		review_comment_url = try values.decodeIfPresent(String.self, forKey: .review_comment_url)
		comments_url = try values.decodeIfPresent(String.self, forKey: .comments_url)
		statuses_url = try values.decodeIfPresent(String.self, forKey: .statuses_url)
		head = try values.decodeIfPresent(Head.self, forKey: .head)
		base = try values.decodeIfPresent(Base.self, forKey: .base)
		_links = try values.decodeIfPresent(Link.self, forKey: ._links)
		author_association = try values.decodeIfPresent(String.self, forKey: .author_association)
	}

}
