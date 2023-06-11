resource "aws_iam_group" "tiktok" {
    name = "tiktok"
    path = "/"
}

resource "aws_iam_group_policy" "s3FullAccess" {
    name = "s3FullAccess"
    group = aws_iam_group.tiktok.name
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "S3FullAccess",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_user" "you" {
    name = "you"
    path = "/"
}

resource "aws_iam_user_group_membership" "you" {
    user = aws_iam_user.you.name
    groups = [aws_iam_group.tiktok.name]
}

resource "aws_iam_user" "me" {
    name = "me"
    path = "/"
}

resource "aws_iam_user_group_membership" "me" {
    user = aws_iam_user.me.name
    groups = [aws_iam_group.tiktok.name]
}


