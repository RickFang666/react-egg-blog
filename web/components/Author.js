
import {Avatar,Divider} from 'antd'
import './styles/author.less'

const Author =()=>{

    return (
        <div className="author-div comm-box">
            <div> <Avatar size={100} src="http://q9v7mvmlz.bkt.clouddn.com/fun.png"  /></div>
            <div className="author-introduction">
                职业写码，业余写字，just so so...
                <Divider>社交账号</Divider>
                <Avatar size={28} icon="github" className="account"  />
                <Avatar size={28} icon="qq"  className="account" />
                <Avatar size={28} icon="wechat"  className="account"  />
            </div>
        </div>
    )

}

export default Author