import React, { useState } from 'react';
import Head from 'next/head';
import Link from 'next/link';
import { Row, Col, List, Icon } from 'antd';
import axios from 'axios';
import Header from '../components/Header';
import Author from '../components/Author';
import Advert from '../components/Advert';
import Footer from '../components/Footer';

const Home = list => {
  console.log('list', list);
  const [mylist, setMylist] = useState(list.data);
  return (
    <>
      <Head>
        <title>Rick's Blog</title>
      </Head>
      <Header />
      <Row className='comm-main' type='flex' justify='center'>
        <Col className='comm-left' xs={24} sm={24} md={16} lg={18} xl={14}>
          <div>
            <List
              header={<div>最新日志</div>}
              itemLayout='vertical'
              dataSource={mylist}
              renderItem={item => (
                <List.Item>
                  <div className='list-title'>
                    {' '}
                    <div className='list-title'>
                      <Link
                        href={{ pathname: '/detailed', query: { id: item.id } }}
                      >
                        <a>{item.title}</a>
                      </Link>
                    </div>
                  </div>
                  <div className='list-icon'>
                    <span>
                      <Icon type='calendar' /> {item.addTime}
                    </span>
                    <span>
                      <Icon type='folder' /> {item.typeName}
                    </span>
                    <span>
                      <Icon type='fire' /> {item.view_count}人
                    </span>
                  </div>
                  <div className='list-context'>{item.introduce}</div>
                </List.Item>
              )}
            />
          </div>
        </Col>

        <Col className='comm-box' xs={0} sm={0} md={7} lg={5} xl={4}>
          <Author />
          {/* <Advert /> */}
        </Col>
        <Footer />
      </Row>
    </>
  );
};
Home.getInitialProps = async () => {
  const res = await axios.get('http://127.0.0.1:7001/default/getArticleList');
  return res.data;
};

// Home.getInitialProps = async ({ req }) => {
//   const res = await axios('https://api.github.com/repos/zeit/next.js')
//   return { stars: res.stargazers_count }
// }

export default Home;
