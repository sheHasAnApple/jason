<style lang="sass" src="./home.scss" scoped></style>

<template>
    <div class="pages">
        <div class="page">
            <div class="scroll-body">
                <mt-swipe :auto="4000">
                    <template v-for="url of urls">
                        <mt-swipe-item>
                            <img :src="url" alt="" width="100%" />
                        </mt-swipe-item>
                    </template>
                </mt-swipe>
                <ul class="list">
                    <li class="item">
                        <div class="left default-img"></div>
                        <div class="right">
                            <div class="text">
                                <h6 class="name">1111专注公版-602-休闲工装鞋子36-42</h6>

                            </div>
                        </div>
                        <div class="bottom-line"></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>

<script>
    export default{
        data:function(){
            return {
                urls:['../style/images/1.jpg','../style/images/2.jpg','../style/images/3.jpg']
            }
        }
    }
</script>